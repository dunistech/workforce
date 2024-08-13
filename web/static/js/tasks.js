    document.getElementById('add-task-button').addEventListener('click', function() {
        addTaskRow();
    });

    function addTaskRow() {
        const taskTableBody = document.getElementById('task-table-body');
        const originalRow = document.getElementById('original-task-row');

        const clonedRow = originalRow.cloneNode(true);
        clonedRow.id = ''; // Clear the id of the cloned row
        // clonedRow.style.visibility = '';  // Ensure the cloned row is visible
        // Assuming clonedRow is already defined somewhere in your code
        clonedRow.classList.remove("d-none");


        // Insert the new row at the top
        taskTableBody.insertBefore(clonedRow, taskTableBody.firstChild);

        // Update the serial number for the new row and subsequent rows
        updateSerialNumbers();
    }

    function saveNewTask(button) {

        const row = button.closest('tr');
        const description = row.querySelector('#assigned_task_select').value;
        const status = row.querySelector('#assigned_task_status').value;
        const timestamp = row.querySelector('input[type="date"]').value;

        if (!description) {
            let desc = row.querySelector('input[type="text"]');
            desc.style.border = "1px inset brown";
            desc.placeholder = "fill-out task description to continue";
            return;
        }

        const task = {
            description: description,
            status: status,
            timestamp: timestamp
        };

        $.ajax({
            url: '/tasks',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(task),
            success: function(data) {
                if (data.success) {

                    showCrudModal('Task saved successfully');
                    // Hide the Save and Cancel buttons
                    row.querySelector('.btn-success').style.display = 'none';
                    row.querySelector('.btn-warning').style.display = 'none';
                    row.classList.remove('new-task-row');

                    // Update serial numbers
                    updateSerialNumbers();

                } else {
                    alert.text(data.error).addClass("alert-warning").removeClass("alert-success");
                }
            },
            error: function(xhr, status, error) {
                showCrudModal(error);
                console.error('Error:', error);
            }
        });
    }

    function updateSerialNumbers() {
        const taskTableBody = document.getElementById('task-table-body');
        const rows = taskTableBody.querySelectorAll('tr');
        rows.forEach((row, index) => {
            const serialCell = row.querySelector('td');
            if (serialCell) {
                serialCell.textContent = index + 1;
            }
        });
    }


    function removeNewTaskRow(button) {
        const row = button.closest('tr');
        row.remove();
        updateSerialNumbers();
    }

    function updateSerialNumbers() {
        const taskTableBody = document.getElementById('task-table-body');
        const rows = taskTableBody.querySelectorAll('tr');
        rows.forEach((row, index) => {
            const serialCell = row.querySelector('td');
            if (serialCell) {
                serialCell.textContent = index + 1;
            }
        });
    }

    function updateTask(element) {
        const taskId = element.getAttribute('data-task-id');
        const row = element.closest('tr');
        const description = row.querySelector('input[type="text"]').value;
        const status = row.querySelector('select').value;
        const timestamp = row.querySelector('input[type="date"]').value;

        const task = {
            id: taskId,
            description: description,
            status: status,
            timestamp: timestamp
        };

        $.ajax({
            url: `/tasks/${taskId}`,
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(task),
            success: function(data) {
                if (data.success) {
                    showCrudModal(data.message);
                    console.log('Task updated successfully');
                } else {
                    showCrudModal(data.error);
                    console.error('Error updating task:', data.error);
                }
            },
            error: function(xhr, status, error) {
                showCrudModal(error);
                console.error('Error:', error);
            }
        });
    }

    function deleteTask(taskId, button) {
        const row = button.closest('tr'); // Capture the row element
        $.ajax({
            url: `/tasks/${taskId}`,
            type: 'DELETE',
            success: function(data) {
                if (data.success) {
                    showCrudModal('Task deleted successfully');
                    console.log('Task deleted successfully');
                    row.remove();
                } else {
                    showCrudModal(data.error);
                    console.error('Error deleting task:', data.error);
                }
            },
            error: function(xhr, status, error) {
                showCrudModal(error);
                console.error('Error:', error);
            }
        });
    }