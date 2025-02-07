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
│ └── ruby/
│ ├── tests/
│ │ ├── test_helper.rb
│ │ ├── test_dialog_helper.rb
│ │ └── test_main.rb
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

## Testing

```sh
# Run all tests (will build frontend first)
yarn test:all

# Run only Ruby tests (will build frontend first)
yarn test:ruby

# Run only frontend tests
yarn test

```

## Packaging

`yarn build:extension`
