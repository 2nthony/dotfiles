local status_todo_comments_ok, todo_comments = pcall(require, 'todo-comments')
if (not status_todo_comments_ok) then return end

todo_comments.setup {}
