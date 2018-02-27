# ESLint for Drupal 8
An ESLint image for Drupal 8.

## Usage

```bash
docker run -it --rm -v /path/to/code:/app millerrs/eslint-drupal8
```

## Usage in Jenkins Pipeline

```groovy
stage('Run ESLint') {
    agent {
        docker {
            image 'millerrs/eslint-drupal8'
        }
    }
    steps {
        sh 'eslint web/modules/custom'
    }
}
```
