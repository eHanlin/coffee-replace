buildPattern = (str) ->
  str = str.replace(/\\/g, '\\\\')
  str.replace(/([\(\)\{\}\^\$\*\+\?\,\.\:\!\<\>\=\|\[\]\-])/g, '\\$1')

buildString = (key, data, arg) ->
  type = typeof data[key]
  if type == 'function'
    if typeof arg != 'undefined'
      return data[key].call(data, arg)
    else
      return data[key].call(data)
  if type == 'undefined' then return 'undefined'
  if data[key] == null then return 'null'
  data[key].toString()

replace = (str, data) ->
  varPattern = /#\{([^#]+?)\}/g;
  functionPattern = /^(.+?)\((.*)\)$/;
  if varPattern.test(str)
    varPattern.lastIndex = 0
    functionPattern.lastIndex = 0
    varMatch = varPattern.exec(str)
    if functionPattern.test(varMatch[1])
      functionMatch = functionPattern.exec(varMatch[1])
      return replace(str.replace(new RegExp(buildPattern(varMatch[0]), 'g'), buildString(functionMatch[1], data, functionMatch[2])), data)
    else
      return replace(str.replace(new RegExp(buildPattern(varMatch[0]), 'g'), buildString(varMatch[1], data)), data)
  else
    return str

String.prototype.coffeeReplace = (data) -> replace(@, data)

if module then module.exports = (str, data) -> replace(str, data)
