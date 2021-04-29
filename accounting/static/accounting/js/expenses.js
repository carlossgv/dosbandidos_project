document.addEventListener('DOMContentLoaded', function () {
  const dropdowns = document.querySelectorAll('select');

  const suppliers = document.querySelector('#id_suppliers');
  const supplierType = document.querySelector('#id_supplier_type');

  const infoButton = document.querySelector('#getInfo');
  const goalsButton = document.querySelector('#getReport');
  const financialsButton = document.querySelector('#getFinancials');
  //   const cashButton = document.querySelector('#getCashReport');

  console.log('suppliers value', suppliers.value);

  dropdowns.forEach((element) => {
    element.addEventListener('change', () => {
      blockInputs();
    });
  });

  function blockInputs() {
    if (suppliers.value != '' || supplierType.value != '') {
      goalsButton.disabled = true;
      financialsButton.disabled = true;
      // cashButton.disabled = true;
    } else {
      goalsButton.disabled = false;
      financialsButton.disabled = false;
      // cashButton.disabled = false;
    }

    if (suppliers.value === '' && supplierType.value === '') {
      infoButton.disabled = true;
    } else {
      infoButton.disabled = false;
    }


    // TODO: There has to be a better way to do this
    if (suppliers.value != '') {
      console.log('i enter this shit');
      nearestInput = supplierType.closest('div').children[0];
      console.log(nearestInput)
      nearestInput.disabled = true;
    } else {
      nearestInput = supplierType.closest('div').children[0];
      nearestInput.disabled = false;
    }

    if (supplierType.value != '') {
      nearestInput = suppliers.closest('div').children[0];
      nearestInput.disabled = true;
    } else {
      nearestInput = suppliers.closest('div').children[0];
      nearestInput.disabled = false;
    }

  }

  blockInputs();
});
