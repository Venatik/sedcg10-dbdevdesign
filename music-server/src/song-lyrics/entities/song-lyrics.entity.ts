import { ApiProperty } from "@nestjs/swagger";
import { Song } from "src/song/entities/song.entity";
import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from "typeorm";

@Entity()
export class SongLyrics {
  @PrimaryGeneratedColumn()
  @ApiProperty({
    example: 1,
    description: 'The unique identifier of the song lyrics',
  })
  id: number;

  @Column('text')
  @ApiProperty({
    example: "Imagine there's no heaven...",
    description: 'Lyrics of the song',
  })
  lyrics: string;

  @OneToOne(() => Song, (song) => song.songLyrics)
  @JoinColumn({ name: 'song_id' })
  @ApiProperty({ type: () => Song })
  song: Song;

  @Column()
  song_id: number;
}

