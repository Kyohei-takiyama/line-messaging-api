VENV := venv

# アサーション署名キーを発行するスクリプトを実行するためのコマンド
run:
	@echo "Creating virtual environment..."
	python3 -m venv $(VENV)
	@echo "Activating virtual environment and installing dependencies..."
	. $(VENV)/bin/activate && pip install -r requirements.txt
	@echo "Running the Python script..."
	. $(VENV)/bin/activate && python3 main.py
	@echo "Cleaning up the virtual environment..."
	rm -rf $(VENV)
	@echo "Done!"

# JWT の発行処理を行うスクリプトを実行するためのコマンド
issue-jwt:
	@echo "Creating virtual environment..."
	python3 -m venv $(VENV)
	@echo "Activating virtual environment and installing dependencies..."
	pip install --upgrade pip
	. $(VENV)/bin/activate && pip install -r requirements.txt
	@echo "Running the Python script..."
	. $(VENV)/bin/activate && python3 issue_jwt.py
	@echo "Cleaning up the virtual environment..."
	rm -rf $(VENV)
	@echo "Done!"

