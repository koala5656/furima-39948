window.addEventListener('turbo:load', () => {

	const priceInput = document.getElementById("item-price");
	priceInput.addEventListener("input", () => {
	  const inputValue = priceInput.value;

		const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

		const displayProfitDom = document.getElementById("profit");
		displayProfitDom.innerHTML = Math.floor(inputValue -  addTaxDom.innerHTML)

	})
})

window.addEventListener('turbo:render', () => {
	const priceInput = document.getElementById("item-price");
	priceInput.addEventListener("input", () => {
	  const inputValue = priceInput.value;

		const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

		const displayProfitDom = document.getElementById("profit");
		displayProfitDom.innerHTML = Math.floor(inputValue -  addTaxDom.innerHTML)

	})
})

