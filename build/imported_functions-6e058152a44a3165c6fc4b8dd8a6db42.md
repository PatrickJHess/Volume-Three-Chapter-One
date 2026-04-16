# Functions Imported by the Chapter.

::::{dropdown} 🔍 View the helper functions of the Chapter

:::{dropdown} Click to see `save_results`

```py
def save_results(save_config={}):
    """
    Interactively prompts the user to confirm and generate a safe save path.

    This function pauses execution and asks the user (y/n) if they want to save
    a file. It is environment-aware:

    - **In Google Colab:** It attempts to use '/content/drive/MyDrive'. If not
      mounted, it will try to mount it. If mounting fails, it falls back
      to the temporary '/content' directory and issues a warning.
    - **In a local environment:** It uses the current working directory.

    The function constructs a full path from the base folder and the optional
    'volume' and 'chapter' subdirectories. All path components are sanitized
    using `pathvalidate`.

    Args:
        save_config (dict, optional): A dictionary containing path components.
            'volume' (str, optional): The name of a top-level subdirectory.
            'chapter' (str, optional): The name of a nested subdirectory.
            'file_name' (str, optional): The final file name.
                Defaults to 'output.txt' if not provided or if sanitization
                results in an empty string.

    Returns:
        str or None: A complete, sanitized, absolute string path to the
            file if the user confirms 'y' and path creation succeeds.
            Returns None if the user chooses 'n' or if an error occurs.
    
    Example:
        config = {
            'volume': 'My_Notebooks',
            'chapter': 'Chapter_01',
            'file_name': 'results.json'
        }
        save_path = save_results(config)
        
        # User inputs 'y'
        
        if save_path:
            # save_path might be '/content/drive/MyDrive/My_Notebooks/Chapter_01/results.json'
            print(f"Saving to: {save_path}")
            # ... proceed to write file ...
    """
    import os
    import sys
    from pathlib import Path
    from pathvalidate import sanitize_filepath
    from IPython.display import display, Markdown as md

    # --- 1. Get user's choice (y/n) ---
    default_value = "n"
    prompt = f"❓ Do you want to save the file? (y/n) (press enter for n): "

    # The 'or default_value' part assigns the default if input is empty
    choice = input(prompt) or default_value

    while choice not in ['y', 'n']:
        choice = input(prompt).strip().lower()

    # --- 2. Handle "No" ---
    if choice == 'n':
        display(md(f'###***❌ File Not Saved***.'))
        return None

    # --- 3. Handle "Yes" ---
    display(md(f"###***⌛ Generating A Path***"))
    isColab = 'google.colab' in sys.modules

    # --- Get and sanitize config values ---
    # Sanitize individual components first. Provide sensible string defaults.
    volume = sanitize_filepath(save_config.get('volume', ''))
    chapter = sanitize_filepath(save_config.get('chapter', ''))
    file_name = sanitize_filepath(save_config.get('file_name', 'output.txt'))
    
    # Ensure file_name is not empty after sanitization
    if not file_name:
        file_name = 'output.txt'

    # Build subfolder path (os.path.join handles empty strings well)
    subfolder = os.path.join(volume, chapter)

    # --- Drive/Folder Logic ---
    base_folder = ''
    drive_path = '/content/drive/MyDrive'
    
    if isColab:
      if os.path.exists(drive_path):
        base_folder = drive_path
      else:
        try:
          from google.colab import drive
          drive.mount('/content/drive')
          base_folder = drive_path
        except Exception as e:
          base_folder = '/content' # Fallback
          display(md(f"### ⚠️ ** Drive Mount Failed:** {e}. Saving to temporary '/content' folder."))
    else:
      base_folder = os.getcwd() # Not in Colab, use current directory

    # --- Path Creation ---
    try:
        # Create the full directory path
        full_folder_path = os.path.join(base_folder, subfolder)
        path_obj = Path(full_folder_path)
        path_obj.mkdir(parents=True, exist_ok=True)
        
        # Join the sanitized directory path and sanitized file name
        final_path_str = os.path.join(str(path_obj), file_name)

        display(md(f'### ✅ **File Path Generated:**\n`{final_path_str}`'))
        
        # *** FIXED WARNING ***
        # Correctly check if the base folder is the temporary one
        if base_folder == '/content':
            display(md(f'### ⚠️ *File is in a temporary location and will be lost on runtime restart.*'))

        # --- THIS IS THE RETURN VALUE ---
        return final_path_str

    except Exception as e:
        display(md(f'### ❌ **ERROR Creating Directory:**'))
        print(e)
        return None
```
:::

:::{dropdown} Click to see `one_y_axis`

```py
def one_y_axis(x_data, y_data_list, title, series_labels, xlabel, ylabel,
                       markers, figure_size, y_limits,save_config={}, fill_config={},
                       colors=None):
    '''
    Plots data on a single y-axis.

    Args:
        x_data (array-like): Data for the x-axis.
        y_data_list (list of array-like): A list of datasets for the y-axis.
        title (str): The title of the graph.
        series_labels (list of str): Identifiers for each data series in the legend.
        xlabel (str): The label for the x-axis.
        ylabel (str): The label for the y-axis.
        markers (list of str): The markers to use for each series.
        figure_size (tuple): The width and height of the figure in inches.
        y_limits (tuple): The minimum and maximum values for the y-axis.
        save_config (dict, optional): Configuration for saving the file, passed
            to save_results(). Keys: 'volume', 'chapter', 'file_name'. Defaults to {}.
        fill_config (dict, optional): Configuration for filling areas.
            Keys: 'Between' (list of 1 or 2 indices from y_data_list),
                  'Start' (int, start index), 'End' (int, end index),
                  'Colors' (str), 'Labels' (str), 'Alpha' (float).
            Defaults to {}.
    Raises:
        ValueError: If input lists for series, markers, or colors do not match the number of y-datasets.
    '''
    import numpy as np
    from matplotlib import pyplot as plt
    num_series = len(y_data_list)
    # --- Input Validation ---
    if not all(len(lst) == num_series for lst in [series_labels, markers]):
        raise ValueError("The 'series_labels' and 'markers' lists must have the same length as 'y_data_list'.")

    if colors and len(colors) != num_series:
        raise ValueError("The 'colors' list must have the same length as 'y_data_list'.")

    # --- Plotting Setup ---
    fig = plt.figure(figsize=figure_size)
    fig.suptitle(title)
    plt.style.use('ggplot')

    if colors is None:
        # Generate a default color cycle if none are provided
        colors = plt.cm.viridis_r(np.linspace(0, 1, num_series))

# --- Plot Data Series ---
    for i in range(num_series):
        plt.plot(x_data, y_data_list[i], label=series_labels[i], marker=markers[i], color=colors[i])

    # --- Handle Fill Area ---
    if fill_config.get('Between'):
        if len(fill_config['Between']) > 2:
            raise ValueError("The 'Between' key in fill_config can contain a maximum of two indices.")


        # Get values from fill_config dict, providing safe defaults
        start = fill_config.get('Start', 0)
        end = fill_config.get('End', len(x_data))
        alpha = fill_config.get('Alpha', 0.3)
        color = fill_config.get('Colors', 'gray')
        label = fill_config.get('Labels', None) # 'None' won't create a legend item

        if len(fill_config['Between']) == 2:
            y1_index, y2_index = fill_config['Between']
            plt.fill_between(x_data[start:end],
                             y_data_list[y1_index][start:end],
                             y_data_list[y2_index][start:end],
                             color=color, alpha=alpha, label=label)
        else:
            y_index = fill_config['Between'][0]
            # Fills between the series and y=0
            plt.fill_between(x_data[start:end],
                             y_data_list[y_index][start:end],
                             color=color, alpha=alpha, label=label)

    # --- Final Touches ---
    plt.ylim(y_limits)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.legend()
    plt.tight_layout()

    # --- Save Figure ---
    # Calls the save_results function (assumed to be defined)
    path = save_results(save_config=save_config)
    if path:
      plt.savefig(path, dpi=300, bbox_inches='tight')

    plt.show()

```
:::
::::
