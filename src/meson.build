homnitor_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
  'data.vala',
  'ref.vala'
]

homnitor_deps = [
  dependency('gtk4'),
]

gnome = import('gnome')

homnitor_sources += gnome.compile_resources('homnitor-resources',
  'gtk_app.gresource.xml',
  c_name: 'homnitor'
)

executable('homnitor', homnitor_sources,
  vala_args: '--target-glib=2.50',  dependencies: homnitor_deps,
  install: true,
)
