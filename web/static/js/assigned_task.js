// alert("make checks")

/* function showCrudModal(message) {
    document.getElementById('crudModalBody').innerText = message;
    $('#crudModal').modal('show');
} */

document.getElementById('assigned-add-task-button').addEventListener('click', function() {
    assignedAddTaskRow();
});

function assignedAddTaskRow() {
    const taskTableBody = document.getElementById('assigned-task-table-body');
    const originalRow = document.getElementById('assigned-original-task-row');

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

function assignedSaveNewTask(button) {
    const row = button.closest('tr');
    const detail = row.querySelector('input[type="text"]').value;
    const duration = row.querySelector('input[type="time"]').value;

    if (!detail) {
        let detail = row.querySelector('input[type="text"]');
        detail.style.border = "1px inset brown";
        detail.placeholder = "fill-out task detail to continue";
        return;
    }

    const task = {
        detail: detail,
        duration: duration
    };

    $.ajax({
        url: '/assigned-tasks',
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


function assignedRemoveNewTaskRow(button) {
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


function assignedUpdateTask(element) {
    const taskId = element.getAttribute('data-task-id');
    const row = element.closest('tr');
    const detail = row.querySelector('input[type="text"]').value;
    const duration = row.querySelector('input[type="time"]').value;

    const task = {
        id: taskId,
        detail: detail,
        duration: duration
    };

    $.ajax({
        url: `/assigned-tasks/${taskId}`,
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

function assignedDeleteTask(taskId, button) {
    const row = button.closest('tr'); // Capture the row element

    $.ajax({
        url: `/assigned-tasks/${taskId}`,
        type: 'DELETE',
        success: function(data) {
            if (data.success) {
                showCrudModal('Task deleted successfully');
                console.log('Task deleted successfully');
                row.remove(); // Remove the row on success
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