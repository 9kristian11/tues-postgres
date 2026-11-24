-- Въпрос 1: Кои книги са навън в момента и при кого?
-- Връща: заглавие, име на ученик, дата на вземане (само невърнати).
SELECT b.title, s.name AS student, l.borrowed_on AS date_taken
FROM loans l
JOIN books    b ON b.id = l.book_id
JOIN students s ON s.id = l.student_id
WHERE l.returned_on IS NULL
ORDER BY l.borrowed_on;

-- Въпрос 2: Кой държи книга повече от 14 дни и коя е тя?
-- Връща: ученик, заглавие, дата на вземане, дни (само невърнати).
SELECT s.name AS student, b.title, l.borrowed_on AS date_taken,
       CURRENT_DATE - l.borrowed_on AS days_kept
FROM loans l
JOIN books    b ON b.id = l.book_id
JOIN students s ON s.id = l.student_id
WHERE l.returned_on IS NULL
  AND CURRENT_DATE - l.borrowed_on > 14
ORDER BY days_kept DESC;