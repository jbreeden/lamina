(function () {
  window.lamina = window.lamina || {};

  lamina.register = function(elementName) {
    var camelCaseName = elementName.split('-')
      .map(function(str) {
        return str[0].toUpperCase() + str.slice(1, str.length);
      })
      .join('');

    var registerFunctionName = 'register' + camelCaseName + 'Element';

    if (typeof lamina[registerFunctionName] != 'function') {
      throw 'Attempted to register undefined element ' + elementName;
    } else {
      lamina[registerFunctionName]();
    }
  }


}());
