module.exports = function (config) {
    config.set({
        basePath: '',
        frameworks: ['jasmine'],
        files: [
            'js/calculator.js',
            'test/calculator.specs.js'
        ],
        preprocessors: {
            'js/calculator.js': ['coverage']
        },
        plugins: [
            'karma-jasmine',
            'karma-phantomjs-launcher',
            'karma-coverage'
        ],
        reporters: ['progress', 'coverage'],
        port: 9878,
        colors: true,
        logLevel: config.LOG_INFO,
        autowatch: true,
        browsers: ['PhantomJS'],
        singleRun: true,
        coverageReporter: {
	        type : 'lcov',
	        dir : 'coverage/'
        }
    });
};
