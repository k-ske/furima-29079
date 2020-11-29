window.addEventListener('load', function(){
  const priceInput = document.getElementById("product-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const taxPrice = Math.floor(inputValue * 0.1);
    document.getElementById("add-tax-price").innerHTML = taxPrice;
    const profitPrice = Math.floor(inputValue * 0.9);
    document.getElementById("profit").innerHTML = profitPrice;
  })
})