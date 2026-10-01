"use strict";

const projects = [...document.querySelectorAll('[data-category]')];
document.querySelectorAll('[data-filter]').forEach(button => {
  button.addEventListener('click', () => {
    document.querySelectorAll('[data-filter]').forEach(item => {
      item.setAttribute('aria-pressed', String(item === button));
    });
    projects.forEach(project => {
      project.hidden = button.dataset.filter !== 'all' && project.dataset.category !== button.dataset.filter;
    });
    document.querySelector('#work-status').textContent = `Showing ${projects.filter(project => !project.hidden).length} projects`;
  });
});

const search = document.querySelector('#faq-search');
if (search) {
  const questions = [...document.querySelectorAll('.faq-section details')];
  search.addEventListener('input', () => {
    const query = search.value.trim().toLowerCase();
    questions.forEach(question => { question.hidden = !question.textContent.toLowerCase().includes(query); });
    const count = questions.filter(question => !question.hidden).length;
    document.querySelector('#faq-status').textContent = `Showing ${count} questions`;
    document.querySelector('#faq-empty').hidden = count !== 0;
  });
}
