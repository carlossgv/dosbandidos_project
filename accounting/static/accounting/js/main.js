document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('select');
  var instances = M.FormSelect.init(elems, {});
  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems, {});
  var dropdowns = document.querySelectorAll('.dropdown-trigger')
  for (var i = 0; i < dropdowns.length; i++){
      M.Dropdown.init(dropdowns[i]);
  }
});