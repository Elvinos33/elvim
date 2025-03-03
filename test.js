// Fibonacci sequence
//

function fibonacci(n) {
  if (n <= 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Another famous sequnece
//

function factorial(n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}

// print first 10 Fibonacci numbers
console.log('Fibonacci numbers');
for (var i = 0; i < 10; i++) {
  console.log(fibonacci(i));
}

// %% print first 10 factorial numbers
console.log('Factorial numbers');
for (var i = 0; i < 10; i++) {
  console.log(factorial(i));
}
