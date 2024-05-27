import { ApiProperty } from "@nestjs/swagger";
import { Artist } from "src/artist/entities/artist.entity";
import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from "typeorm";

@Entity()
  export class ArtistDetails {
    @PrimaryGeneratedColumn()
    @ApiProperty({
      example: 1,
      description: 'The unique identifier of the artist details',
    })
    id: number;
  
    @Column()
    @ApiProperty({
      example: '1940-10-09',
      description: 'Date of birth of the artist',
      type: 'string',
      format: 'date',
    })
    date_of_birth: Date;
  
    @Column({ length: 100, nullable: true })
    @ApiProperty({
      example: 'John Winston Ono Lennon',
      description: 'Full name of the artist',
      nullable: true,
    })
    full_name: string;
  
    @Column({ length: 100, nullable: true })
    @ApiProperty({
      example: 'United Kingdom',
      description: 'Country of the artist',
      nullable: true,
    })
    country: string;
  
    @Column({ length: 100, nullable: true })
    @ApiProperty({
      example: 'Liverpool',
      description: 'City of the artist',
      nullable: true,
    })
    city: string;
  
    @Column()
    @ApiProperty({ example: true, description: 'Marital status of the artist' })
    is_married: boolean;
  
    @Column({ length: 100, nullable: true })
    @ApiProperty({
      example: 'Yoko Ono',
      description: 'Name of the spouse',
      nullable: true,
    })
    spouse_name: string;
  
    @OneToOne(() => Artist, (artist) => artist.artistDetails)
    @JoinColumn({ name: 'artist_id' })
    @ApiProperty({ type: () => Artist })
    artist: Artist;
  
    @Column()
    artist_id: number;
  }
