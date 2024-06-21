import { createI18n } from 'vue-i18n'
import axios from 'axios'
import moment from "moment"

app = null

browserLang = ->
  index = navigator.language.indexOf('-')
  if index >= 0
    navigator.language.substring(0, navigator.language.indexOf('-'))
  else
    navigator.language

languages = ['de', 'en']

isBrowserLangExistent = languages.includes(browserLang())

export init = (messages, pathname, App, scrollToTop = yes) ->
  i18n = createI18n
    locale: if isBrowserLangExistent then browserLang() else 'en'
    messages: messages()
    globalInjection: true

  axios.interceptors.response.use (response) ->
    if response.status is 403
      window.location.href = '/'
      return
    if response.status >= 400 and not response.data.flash
      response.data = flash: alert: i18n.t('vue.errors.unknown')
    if response.data.flash and scrollToTop
      window.scrollTo left: 0, top: 0, behavior: 'smooth'
    return response

  axios.interceptors.request.use (config) ->
    csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    config.headers.common['X-CSRF-TOKEN'] = csrfToken
    config.headers.common['X-Requested-With'] = 'XMLHttpRequest'
    config.headers.common['Accept'] = 'application/json'
    return config

  moment.locale(navigator.language)

  ###document.addEventListener('turbolinks:load', ->
    element = document.getElementById('vue')
    if element? and window.location.pathname.includes(pathname)
      # turbolink is destroying vue instance everytime
      app = createApp(App)
        #.use(store)
        .use(i18n)
        #.use(vfmPlugin)
        #.use(TurbolinksAdapter)
        #.use(easySpinner, { prefix: 'easy' })
        #.use(Loading)
      app.config.globalProperties.$http=axios
      app.mount('#vue')
    return
  )###