//= require active_admin/base
document.addEventListener('DOMContentLoaded', function () {
  const header = document.querySelector('#header.active_admin_header');
  const title = document.querySelector('#site_title a');

  if (header) {
    header.style.backgroundColor = '#bfdbfe';
    header.style.borderBottom = '1px solid #93c5fd';
  }

  if (title) {
    title.style.color = '#1e3a8a';
    title.style.fontWeight = 'bold';
  }
});
