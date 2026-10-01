'use strict';

const menuToggle = document.querySelector('.menu-toggle');
const navigation = document.querySelector('#main-nav');

if (menuToggle && navigation) {
  menuToggle.hidden = false;
  document.documentElement.classList.add('has-menu');
  const closeMenu = () => {
    menuToggle.setAttribute('aria-expanded', 'false');
    navigation.classList.remove('is-open');
  };
  menuToggle.addEventListener('click', () => {
    const open = menuToggle.getAttribute('aria-expanded') !== 'true';
    menuToggle.setAttribute('aria-expanded', String(open));
    navigation.classList.toggle('is-open', open);
  });
  navigation.addEventListener('click', event => {
    if (event.target.closest('a')) closeMenu();
  });
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && navigation.classList.contains('is-open')) {
      closeMenu();
      menuToggle.focus();
    }
  });
  document.addEventListener('click', event => {
    if (!navigation.contains(event.target) && !menuToggle.contains(event.target)) closeMenu();
  });
}

const message = document.querySelector('#message');
const counter = document.querySelector('#message-count');
if (message && counter) {
  const updateCounter = () => {
    counter.textContent = `${message.value.length.toLocaleString()} / 2,000`;
  };
  message.addEventListener('input', updateCounter);
  updateCounter();
}

const notice = document.querySelector('[data-form-notice]');
if (notice) notice.focus();
