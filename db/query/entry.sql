-- name: CreateEntry :one
INSERT INTO entries (
    account_id,
    amount
) VALUES (
    @account_id, @amount
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM entries
WHERE id = @id LIMIT 1;

-- name: GetAllEntry :many
SELECT * FROM entries
WHERE account_id = $1 
ORDER BY id
LIMIT $2
OFFSET $3;
