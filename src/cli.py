from .controllers.extract_information import create_gradio_ui


def run():
    demo = create_gradio_ui()
    return demo.launch(server_name="0.0.0.0", ssl_verify=False, debug=True)
