# Vector Database Benchmark for Chatbot Applications

**Author:** Cihat Özkurt  
**Institution:** TH Köln - University of Applied Sciences  
**Program:** Master's in Computer Science  

## Project Overview

This project provides a comprehensive benchmarking framework for evaluating vector databases (FAISS, ChromaDB, Qdrant, Weaviate) in the context of chatbot and RAG (Retrieval-Augmented Generation) applications. The benchmark uses the BEIR dataset collection and multiple embedding models to assess performance across various metrics.

## Tested Configurations

### Vector Databases
- **FAISS** - Facebook AI Similarity Search (Local)
- **ChromaDB** - Open-source embedding database (Local)
- **Qdrant** - Vector similarity search engine (Docker)
- **Weaviate** - Vector search engine (Docker)

### Embedding Models
- `all-MiniLM-L6-v2` (384 dimensions)
- `paraphrase-multilingual-MiniLM-L12-v2` (384 dimensions)
- `bge-base-en-v1.5` (768 dimensions)
- `e5-base-v2` (768 dimensions)

### Datasets (BEIR)
- ArguAna, SciFact, SciDocs, NFCorpus, NQ, TREC-COVID
- Total: ~3.3 million documents

## Quick Start

### Prerequisites
- Docker and Docker Compose
- At least 16GB RAM recommended
- GPU optional (CUDA support for faster embeddings)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/vector-database-benchmark.git
cd vector-database-benchmark
```

2. Start all services:
```bash
docker-compose up -d
```

3. Access Jupyter Lab:
```
http://localhost:8888
```

### Service Endpoints
| Service | URL | Description |
|---------|-----|-------------|
| Jupyter Lab | http://localhost:8888 | Main benchmark environment |
| Qdrant | http://localhost:6333 | Qdrant REST API |
| Weaviate | http://localhost:8080 | Weaviate REST API |

## Project Structure

```
vector-database-benchmark/
├── Dockerfile                 # Python environment
├── docker-compose.yml         # All services orchestration
├── requirements.txt           # Python dependencies
├── notebooks/
│   └── VECTOR_project.ipynb   # Main benchmark notebook
├── data/
│   ├── raw_data/              # Downloaded BEIR datasets
│   ├── processed_data/        # Processed documents
│   ├── embeddings/            # Pre-computed embeddings
│   └── evaluation/            # Query embeddings & ground truth
└── results/
    ├── faiss/                 # FAISS benchmark results
    ├── chroma/                # ChromaDB benchmark results
    ├── qdrant/                # Qdrant benchmark results
    └── weaviate/              # Weaviate benchmark results
```

## Benchmark Metrics

- **Recall@K** - Retrieval accuracy (K=10, 100)
- **Latency** - Query response time (ms)
- **QPS** - Queries per second
- **Build Time** - Index construction time
- **Storage** - Memory/disk usage

## Running Without Docker

If you prefer to run locally:

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# or: venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Start Qdrant (separate terminal)
docker run -p 6333:6333 qdrant/qdrant:v1.7.4

# Start Weaviate (separate terminal)
docker run -p 8080:8080 cr.weaviate.io/semitechnologies/weaviate:1.27.1

# Run Jupyter
jupyter lab
```

## Key Findings

1. **FAISS** offers maximum flexibility with various index types (Flat, IVF, PQ)
2. **MiniLM** provides the best recall-to-latency ratio for most use cases
3. **Quantization** (IVFPQ) achieves up to 384x compression with acceptable accuracy loss
4. **Smart routing** enables optimal database selection based on query requirements

## License

This project is submitted as part of a Master's thesis at TH Köln.

## Contact

Cihat Özkurt - [Your Email]
