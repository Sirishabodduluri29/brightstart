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
const messageStatus = document.querySelector('#message-status');
if (message && counter && messageStatus) {
  let minimumMet = null;
  const updateCounter = () => {
    const length = message.value.length;
    const meetsMinimum = length >= message.minLength;
    counter.textContent = `${length.toLocaleString()} / ${message.maxLength.toLocaleString()}`;
    if (minimumMet !== meetsMinimum) {
      messageStatus.textContent = meetsMinimum
        ? 'Minimum length met.'
        : `At least ${message.minLength} characters are required.`;
      messageStatus.classList.toggle('is-valid', meetsMinimum);
      minimumMet = meetsMinimum;
    }
  };
  message.addEventListener('input', updateCounter);
  updateCounter();
}

const notice = document.querySelector('[data-form-notice]');
if (notice) notice.focus();
