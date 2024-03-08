module.exports = function (api) {
  api.cache(true)

  const presets = [
    [
      '@babel/preset-env',
      {
        targets: {
          node: 'current',
        },
      },
    ],
  ]

  const plugins = ['@babel/plugin-syntax-dynamic-import', '@babel/plugin-transform-runtime']

  return {
    presets,
    plugins,
  }
}
