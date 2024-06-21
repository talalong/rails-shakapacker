
import { init } from './main.coffee';
//import App from '../apps/assessment-app.vue'

let languages = ['de', 'en'];

const messages = () => {
  let i, lang, len, locale, locales;
  locales = {};
  for (i = 0, len = languages.length; i < len; i++) {
    lang = languages[i];
    locale = require('../../../config/locales/' + lang + '.yml');
    locales[lang] = locale.json[lang];
  }
  return locales;
};
console.log('asdadsa')
init(messages, 'assessments', App);