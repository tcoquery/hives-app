# hives-app

### Prerequisites :

- ruby 3.0.5
- rails 7.1.3.3
- nodejs 22.2.0

### Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/tcoquery/hives-app.git
    cd hives-app
    ```

2. Install backend dependencies:

    ```bash
    bundle install
    ```

3. Install frontend dependencies:

    ```bash
    cd vue-project
    npm i
    ```

4. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```
## Usage

### Running the Application

1. Start the Rails server:

    ```bash
    rails server
    ```

2. In a separate terminal, start the Vite development server for Vue.js:

    ```bash
      cd vue-project
      npm run dev
    ```

3. Open your browser and navigate to `http://localhost:5173`.

### Running tests :

```
  bundle exec rspec
```
