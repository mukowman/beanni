#!/usr/bin/env node
import program from 'commander';
import tsnode = require('ts-node');

program
    .arguments('<institution>')
    .option('-u, --username <username>', 'The user to authenticate as')
    .option('-p, --password <password>', 'The user\'s password')
    .action(function(institution) {
        var institutionName = institution + '.ts';
        var institutionPath = '../institutions/' + institutionName;

        console.log("Running institution %s (%s)", institution, institutionPath);

        tsnode.register({
            skipProject: true,
            transpileOnly: true
        });

        require(institutionPath);
    })
    .parse(process.argv);

console.log('No params? Try --help');
