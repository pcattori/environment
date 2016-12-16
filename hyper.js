module.exports = {
  config: {
    fontSize: 24,
    fontFamily: 'Menlo',
    cursorShape: 'BLOCK',
    padding: '12px 14px',
    bell: false,
    // for advanced config flags please refer to https://hyper.is/#cfg
  },
  plugins: [
    'hyperfull',
    'hyper-blink',
    'hyperterm-atom-dark', // theme
    //'hyperterm-tabs' // https://github.com/zeit/hyper/issues/911
    //'hyperterm-tab-icons' // not working with hyper v1.0.0
  ]
};
