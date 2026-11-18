CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL CHECK (
        email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'
    )
);

CREATE TABLE poses (
    pose_id INTEGER PRIMARY KEY,
    pose_name VARCHAR(50) NOT NULL CHECK (pose_name ~* '^Warrior II$')
);

CREATE TABLE workouts (
    workout_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    pose_id INTEGER NOT NULL,
    workout_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (pose_id) REFERENCES poses (pose_id)
);
