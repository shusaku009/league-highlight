module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("daisyui"),
    require('@tailwindcss/line-clamp')
  ],
  daisyui: {
    themes: ["bumblebee"]
  },
  purge: {
    options: {
      safelist: ['alert-success', 'alert-error']
    }
  }
}
