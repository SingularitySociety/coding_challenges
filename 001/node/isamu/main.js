// usage: node main.js

const next_val = (i) => {
  return String(i).split("").reduce((n, c) => {return n * c}, 1 )
}
const calc = (i) => {
  if (i < 10 ) {
    return i;
  }
  
  return next_val(i)
};

const main = () => {
  let i = 1;
  let max = 0;
  while(true) {
    let n = 0

    res = i;
    while(res > 9) {
      res = calc(res);
      n = n + 1;
    }

    if (max < n) {
      max = n;
      console.log(i, n);
    }
    i ++;
  }
};

main();