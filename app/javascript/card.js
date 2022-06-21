window.addEventListener('load', function () {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const button = document.getElementById("button");
  button.addEventListener('click', function (e) {
    e.preventDefault();
    const form = document.getElementById("charge-form")
    const formData = new FormData(form);

    const card = {
      number: formData.get("purchase_shipping_address[number]"),
      exp_month: formData.get("purchase_shipping_address[exp_month]"),
      exp_year: `20${formData.get("purchase_shipping_address[exp_year]")}`,
      cvc: formData.get("purchase_shipping_address[cvc]"),
    };

    Payjp.createToken(card, (HTTPstatus, response) => {
      if (HTTPstatus == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name= 'token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
      };
    });

    form.submit();
  });
});