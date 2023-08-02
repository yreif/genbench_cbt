{
    name: 'Bias-amplified Splits (QQP)',

    description: 'We take Quora Question Pairs (QQP) and extract a bias-amplified training set and an anti-biased test set for it from the original splits. For resplitting, we use a novel clustering-based approach to detect anti-biased minority examples.',

    keywords: [
        'non-i.i.d. generalization',
        'dataset biases',
        'minority examples',
        'robustness'
    ],

    authors: [
        'Yuval Reif',
        'Roy Schwartz'
    ],

    data_source: {
        type: 'hf',
        hf_id: ['glue', 'qqp'],
        git_commit_sha: 'fd8e86499fa5c264fcaad392a8f49ddf58bf4037',
    },

    has_validation_set: true,
    has_train_set: true,

    task_type: 'multiple_choice',

    field_mapping: {
        input: 'sentence_pair',
        target: 'label',
    },

    split_file: 'split.jsonnet',

    evaluation_metrics: [
        {
            hf_id: 'accuracy',
            git_commit_sha: '34d6add55811828baef83e0d7c6826e2193f7b6a',
            best_score: 1.0,
        },
        {
            hf_id: 'f1',
            git_commit_sha: '3a4c40f7397dcd7d9dccf0659616dc6b14072dcb',
            best_score: 1.0,
        }
    ],

    preparation_strategies: {
        // Finetuning the model on the task's train-set and then evaluating
        // on the task's test-set. This is suitable for models such as RoBERTa, BERT, etc.,
        // but can be used for LLMs as well.
        finetuning: {
            objective: 'maximum_likelihood',
            // ... other model-agnostic finetuing options ...
        }
    },
}