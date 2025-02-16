# sketchup-extension-react

A boilerplate for Sketchup extension with React

## Structure

```sh
.
├── src/
│ ├── ts/
│ │ ├── components/
│ │ │ ├── App.tsx
│ │ │ └── __tests__/
│ │ │ └── App.test.tsx
│ │ ├── types/
│ │ │ └── sketchup.d.ts
│ │ └── main.tsx
│ └── rb/
│ ├── tests/
│ │ ├── test_dialog_helper.rb
│ │ ├── test_loader.rb
│ │ └── test_helper.rb # helper for mocking Sketchup API
│ ├── loader.rb
│ └── dialog_helper.rb
├── public/
│ └── favicon.ico
├── dist/ # Ruby will read from here
├── index.html
├── package.json
├── tsconfig.json
├── tsconfig.node.json
├── vite.config.ts
├── vitest.config.ts
├── .gitignore
├── .yarnrc.yml
├── Rakefile
├── .rubocop.yml
└── my_extension.rb
```

## Install dependencies

Run command in terminal

Install gems for Ruby
`gem install minitest rake rubyzip rubocop`

Install for React UI
`yarn install`

## Development

Build once `yarn build`

Or watch for changes `yarn watch`

## Formatting

Auto format enable fot VSCode
The TS formats via prettier extension, Ruby formats via vscode-rubocop extension

## Testing

For ruby test, better build the frontend first

```sh
# Run all tests
yarn test:all

# Run only Ruby tests
yarn test:ruby

# Run only frontend tests
yarn test

```

To run specific ruby test, run
`rake test TEST=path/to/file.rb`

## Packaging

`yarn build:extension`
