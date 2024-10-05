// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

// Enable all Bootstrap tooltips
const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});

document.addEventListener('turbo:load', () => {
  const confirmDeleteButton = document.getElementById('confirmDeleteButton');
  const deleteLinks = document.querySelectorAll('[data-bs-target="#confirmDeleteModal"]');

  deleteLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      const journalId = e.target.getAttribute('data-id');
      const form = document.getElementById('deleteJournalForm');
      form.setAttribute('action', `/journals/${journalId}`);
    });
  });
});

import "trix"
import "@rails/actiontext"
