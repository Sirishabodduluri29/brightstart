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
  const filterButtons = [...document.querySelectorAll('[data-faq-filter]')];
  let activeCategory = 'all';
  const updateQuestions = () => {
    const query = search.value.trim().toLowerCase();
    const visibleQuestions = questions.filter(question => {
      const matchesQuery = question.textContent.toLowerCase().includes(query);
      const matchesCategory = activeCategory === 'all' || question.dataset.category === activeCategory;
      question.hidden = !matchesQuery || !matchesCategory;
      return !question.hidden;
    });
    const count = visibleQuestions.length;
    const isDefaultView = activeCategory === 'all' && query === '';
    document.querySelector('#faq-status').textContent = isDefaultView
      ? `Showing ${count} questions`
      : `Showing ${count} of ${questions.length} questions`;
    document.querySelector('#faq-empty').hidden = count !== 0;
  };
  filterButtons.forEach(button => {
    button.addEventListener('click', () => {
      activeCategory = button.dataset.faqFilter;
      filterButtons.forEach(item => item.setAttribute('aria-pressed', String(item === button)));
      updateQuestions();
    });
  });
  search.addEventListener('input', updateQuestions);
  updateQuestions();
}
