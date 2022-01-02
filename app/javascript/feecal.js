function feecal (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemTax = Math.floor((itemPrice.value)*0.1);
    const itemProfit  = itemPrice.value - itemTax;
    const TaxPlace = document.getElementById("add-tax-price");
    const ProfitPlace = document.getElementById("profit");
    TaxPlace.innerHTML = `${itemTax}`;
    ProfitPlace.innerHTML = `${itemProfit}`;
  });
};

window.addEventListener('load', feecal);
