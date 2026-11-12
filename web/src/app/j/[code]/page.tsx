import type { Metadata } from 'next';
import { Footer, Nav, StoreButtons } from '@/components/site';
import { connectDB } from '@/lib/db';
import { Group, User, type GroupDoc } from '@/lib/models';
import { normalizeCode } from '@/lib/groups';

type Props = { params: Promise<{ code: string }> };

async function lookup(raw: string) {
  const code = normalizeCode(raw);
  try {
    await connectDB();
    const group = await Group.findOne({ code }, { name: 1, ownerId: 1, members: 1, status: 1 }).lean<GroupDoc>();
    if (!group) return { code, group: null };
    const owner = await User.findById(group.ownerId, { name: 1 }).lean();
    return { code, group: { name: group.name, owner: owner?.name ?? 'Iemand', members: group.members.length } };
  } catch {
    return { code, group: null };
  }
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { group } = await lookup((await params).code);
  const title = group ? `${group.owner} nodigt je uit voor ${group.name}` : 'Uitnodiging voor CamTrip';
  return { title, description: 'Join de groep in CamTrip en zie alle foto’s direct.', openGraph: { title, images: ['/icon.png'] } };
}

/**
 * The invite link. With the app installed, iOS/Android open the app directly
 * (universal links / app links); without it, this page shows the code and
 * the download buttons.
 */
export default async function Invite({ params }: Props) {
  const { code, group } = await lookup((await params).code);
  return (
    <>
      <Nav />
      <main className="invite">
        <p className="eyebrow">UITNODIGING</p>
        <h1 className="display">
          {group ? (
            <>
              {group.owner} nodigt je uit voor <span className="accent">{group.name}</span>
            </>
          ) : (
            'Join een groep in CamTrip'
          )}
        </h1>
        {group && <p className="members">{group.members} mensen zitten er al in</p>}
        <div className="card">
          <p>GROEPSCODE</p>
          <div className="code">{code}</div>
        </div>
        <p>1. Download CamTrip &nbsp; 2. Tik op “Ik heb een code” &nbsp; 3. Vul de code in</p>
        <StoreButtons />
        <p className="have-app">
          <a className="btn dark" href={`camtrip://join/${code}`}>
            Ik heb de app al
          </a>
        </p>
      </main>
      <Footer />
    </>
  );
}
