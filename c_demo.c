#include <gtk/gtk.h>

// Function to handle the application activation
static void activate(GtkApplication *app, gpointer user_data) {
    // Create a new GTK window
    GtkWidget *window = gtk_application_window_new(app);

    // Set the window title
    gtk_window_set_title(GTK_WINDOW(window), "Hello, World!");

    // Set the window default size
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    // Create a label widget with "Hello, World!" text
    GtkWidget *label = gtk_label_new("Hello, World!");

    // Add the label widget to the window
    gtk_window_set_child(GTK_WINDOW(window), label);

    // Show all widgets
    gtk_widget_show(window);
}

int main(int argc, char **argv) {
    // Create a new GTK application
    GtkApplication *app = gtk_application_new("org.example.hello", G_APPLICATION_FLAGS_NONE);

    // Connect the "activate" signal to the callback function
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);

    // Run the application
    int status = g_application_run(G_APPLICATION(app), argc, argv);

    // Release resources
    g_object_unref(app);

    return status;
}