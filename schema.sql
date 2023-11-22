CREATE TABLE Item (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

-- Create Author Table
CREATE TABLE authors (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    FOREIGN KEY (item_id) REFERENCES Item(id)
  );

CREATE INDEX idx_authors_item_id ON authors(item_id);


-- Create Game Table
CREATE TABLE games (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author_id INT,
    FOREIGN KEY (item_id) REFERENCES Item(id)
  );

  CREATE INDEX idx_games_item_id ON games(item_id);


  -- Create Book Table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(100),
    cover_state VARCHAR(50),
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE INDEX idx_books_item_id ON books(item_id);


-- Create Label Table
CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    color VARCHAR(20)
);

-- Create ItemLabel Table (Many-to-Many Relationship)
CREATE TABLE item_labels (
    item_id INT,
    label_id INT,
    PRIMARY KEY (item_id, label_id),
    FOREIGN KEY (item_id) REFERENCES Item(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Music Album 
CREATE TABLE genre(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150),
    item_id INTEGER,
    FOREIGN KEY(item_id) REFERENCES Item(id)
)
CREATE TABLE musicAlbum (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    on_spotify BOOLEAN,
    publish_date DATE,
    item_id INTEGER,
    FOREIGN KEY(item_id) REFERENCES Item(id)
);