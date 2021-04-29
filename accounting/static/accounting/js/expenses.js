document.addEventListener('DOMContentLoaded', function () {
  const dropdowns = document.querySelectorAll('select');

  const suppliers = document.querySelector('#id_suppliers');
  const supplierType = document.querySelector('#id_supplier_type');

  const goalsButton = document.querySelector('#getReport');
  //   const cashButton = document.querySelector('#getCashReport');

  dropdowns.forEach((element) => {
    element.addEventListener('change', () => {
      if (suppliers.value != '' || supplierType.value != '') {
        goalsButton.disabled = true;
        // cashButton.disabled = true;
      } else {
        goalsButton.disabled = false;
        // cashButton.disabled = false;
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
    });
  });
});
