// Given 2 strings, find if there is a string that appears in both strings

function twoStrings(words) {
  var shorter, longer;
  var longerHash = {};
  var hasSub = false;
  var results = [];

  for (var pair = 0;
    (pair * 2) < words.length; pair++) {
    var currentPair = words.slice(pair * 2, (pair * 2) + 2);

    if (currentPair[0].length > currentPair[1].length) {
      longer = currentPair[0].split("");
      shorter = currentPair[1].split("");
    } else {
      longer = currentPair[1].split("");
      shorter = currentPair[0].split("");
    }

    for (var j = 0; j < longer.length; j++) {
      longerHash[longer[j]] = true;
    }

    for (var i = 0; i < shorter.length; i++) {
      if (longerHash[shorter[i]]) {
        hasSub = true;
        break;
      }
    }

    if (hasSub) {
      results.push("YES");
    } else {
      results.push("NO");
    }
    hasSub = false;
    longerHash = {};
  }

  console.log(results.join("\n"));
}
