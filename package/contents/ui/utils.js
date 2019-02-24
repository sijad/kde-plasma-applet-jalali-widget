function convertToPersianDigits(str) {
  var newStr = '';
  for (var i = 0; i < str.length; i++)
  {
      var c = str.charCodeAt(i);
      if (c >= 48 && c <= 57) {
        c += 1728;
      }
      newStr += String.fromCharCode(c);
  }
  return newStr;
}
