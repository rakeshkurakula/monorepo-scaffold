# Monorepo Scaffold Makefile
# Common tasks for the monorepo

.PHONY: help install clean build test lint format dev

# Default target
help:
	@echo "Available targets:"
	@echo "  install  - Install all dependencies"
	@echo "  clean    - Clean build artifacts"
	@echo "  build    - Build all applications"
	@echo "  test     - Run all tests"
	@echo "  lint     - Run linting"
	@echo "  format   - Format code"
	@echo "  dev      - Start development servers"

# Install dependencies
install:
	@echo "Installing dependencies..."
	npm install
	cd apps/api && pip install -r requirements.txt

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf node_modules/.cache
	rm -rf apps/*/dist
	rm -rf apps/*/.next
	rm -rf packages/*/dist

# Build all applications
build:
	@echo "Building all applications..."
	npm run build

# Run tests
test:
	@echo "Running tests..."
	npm run test

# Lint code
lint:
	@echo "Linting code..."
	npm run lint
	cd apps/api && python -m flake8 .

# Format code
format:
	@echo "Formatting code..."
	npm run format
	cd apps/api && python -m black .

# Start development servers
dev:
	@echo "Starting development servers..."
	npm run dev
