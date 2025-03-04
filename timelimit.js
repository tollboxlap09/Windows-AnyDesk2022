const { execSync } = require('child_process');
const psList = require('ps-list');

const thresholdPercentage = 30;
const excludedProcesses = ['devenv.exe', 'HopToDesk.exe', 'msedge.exe', 'chrome.exe', 'powershell.exe', 'WmiPrvSE.exe', 'dwm.exe']; // List of process names to exclude

async function main() {
    while (true) {
        const processes = await psList();
        for (const process of processes) {
            const processName = process.name;
            if (processName !== 'Idle' && processName !== 'System Idle Process') {
                const cpuPercent = process.cpu;
                if (cpuPercent > thresholdPercentage && !excludedProcesses.includes(processName)) {
                    console.log(`High CPU Usage detected in process: ${processName} (${cpuPercent}%)`);
                    try {
                        execSync(`taskkill /F /IM ${processName}`);
                        console.log(`Terminated process: ${processName}`);
                    } catch (error) {
                        console.log(`Failed to terminate process: ${processName}`);
                    }
                }
            }
        }
        await new Promise(resolve => setTimeout(resolve, 10000)); // Adjust the sleep duration as needed (10 seconds)
    }
}

main().catch(console.error);
