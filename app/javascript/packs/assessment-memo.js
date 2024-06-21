import { init } from './main.coffee'
import 'vue-loading-overlay/dist/css/index.css'
//import App from '../apps/assessment-memo-app.vue'

const messages = () => {
  return require('../../../config/locales/assessment_memos.yml').json;
};

init(messages, 'assessment_memos', App, false);
