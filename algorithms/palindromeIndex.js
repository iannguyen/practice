// Given a string, find the index of the string which when removed, will make the string a palindrome. If it is already a palindrome return -1

function palindromeIndex(words) {
  var results = [];

  words.forEach(function(word) {
    var palIdx = isPalindrome(word);
    var palOppIdx = word.length - 1 - palIdx;

    if (palIdx === (-1)) {
      results.push(palIdx);
    } else {
      if (word[(palIdx + 1)] === word[palOppIdx] &&
        word[palIdx + 2] == word[palOppIdx - 1]) {
        results.push(palIdx);
      } else {
        results.push(palOppIdx);
      }
    }
  });

  console.log(results.join("\n"));
}

// Helper

function isPalindrome(word) {
  var pal = -1;
  var i = 0;
  var j = word.length - 1;

  while (i <= j) {
    if (word[i] !== word[j]) {
      pal = i;
      break;
    }
    i++;
    j--;
  }
  return pal;
}
