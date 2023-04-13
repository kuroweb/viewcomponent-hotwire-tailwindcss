module.exports = {
  darkMode: 'light',
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    'preline/dist/*.js',
  ],
  plugins: [require('preline/plugin')],
};
