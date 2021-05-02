document.addEventListener('DOMContentLoaded', function () {
  const dropdowns = document.querySelectorAll('select');

  const suppliers = document.querySelector('#id_suppliers');
  const supplierType = document.querySelector('#id_supplier_type');
  const cash = document.querySelector('#id_cash');

  const infoButton = document.querySelector('#getInfo');
  const goalsButton = document.querySelector('#getReport');
  const financialsButton = document.querySelector('#getFinancials');
  const cashButton = document.querySelector('#getCashReport');

  dropdowns.forEach((element) => {
    element.addEventListener('change', () => {
      blockInputs();
    });
  });

  cash.addEventListener('keyup', () => {
    blockInputs();
  });

  function blockInputs() {
    if (cash.value != '') {
      goalsButton.disabled = true;
      financialsButton.disabled = true;
      infoButton.disabled = true;
      cashButton.disabled = false;
      return;
    } else {
      cashButton.disabled = true;
      goalsButton.disabled = false;
      financialsButton.disabled = false;
      infoButton.disabled = false;
    }

    if (suppliers.value != '' || supplierType.value != '') {
      goalsButton.disabled = true;
      financialsButton.disabled = true;
      cashButton.disabled = true;
      cash.disabled = true;
    }

    if (suppliers.value === '' && supplierType.value === '') {
      infoButton.disabled = true;
      goalsButton.disabled = false;
      financialsButton.disabled = false;
      cash.disabled = false;
    } else {
      infoButton.disabled = false;
    }

    // TODO: There has to be a better way to do this
    if (suppliers.value != '') {
      nearestInput = supplierType.closest('div').children[0];
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
